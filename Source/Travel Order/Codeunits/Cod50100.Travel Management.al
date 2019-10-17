codeunit 50100 "Travel Management"
{
    trigger OnRun()
    begin
        DeploySetup();
    end;

    var
        NoSeriesCodeTxt: Label 'EMP-TO';
        NoSeriesDescTxt: Label 'Travel Orders';
        NoSeriesStartTxt: Label 'TO-00001';

    procedure DeploySetup()
    var
        HRSetup: Record "Human Resources Setup";
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin
        if not NoSeries.Get(NoSeriesCodeTxt) then begin
            NoSeries.Init();
            NoSeries.Validate(Code, NoSeriesCodeTxt);
            NoSeries.Validate(Description, NoSeriesDescTxt);
            NoSeries.Validate("Default Nos.", true);
            NoSeries.Validate("Manual Nos.", false);
            NoSeries.Insert(true);
        end;

        if not NoSeriesLine.GET(NoSeriesCodeTxt, 10000) then begin
            NoSeriesLine.Init();
            NoSeriesLine.Validate("Series Code", NoSeriesCodeTxt);
            NoSeriesLine.Validate("Line No.", 10000);
            NoSeriesLine.Validate("Starting No.", NoSeriesStartTxt);
            NoSeriesLine.Validate("Increment-by No.", 1);
            NoSeriesLine.Insert(true);
        end;

        HRSetup.Get();
        HRSetup."Travel Order Nos." := NoSeriesLine."Series Code";
        HRSetup.Modify();
    end;

    procedure GetNoSeriesCode(): Code[20];
    var
        HRSetup: Record "Human Resources Setup";
    begin
        HRSetup.Get();
        if HRSetup."Travel Order Nos." = '' then begin
            DeploySetup();
            HRSetup.Get();
        end;
        HRSetup.TestField("Travel Order Nos.");
        exit(HRSetup."Travel Order Nos.");
    end;

    procedure UpdateHeaderFromPlanLines(TravelOrderNo: Code[20])
    var
        TravelOrder: Record "Travel Order";
        TravelOrderPlanLine: Record "Travel Order Plan Line";
        ModifyHeader: Boolean;
    begin
        ModifyHeader := false;
        TravelOrder.Get(TravelOrderNo);
        TravelOrderPlanLine.SetRange("Travel Order No.", TravelOrderNo);
        TravelOrderPlanLine.SetCurrentKey("Travel Order No.", "Start Date");
        if TravelOrderPlanLine.FindFirst() then begin
            ModifyHeader := ModifyHeader or (TravelOrder."Start Date" <> TravelOrderPlanLine."Start Date");
            TravelOrder."Start Date" := TravelOrderPlanLine."Start Date";
        end;
        if TravelOrderPlanLine.FindLast() then begin
            ModifyHeader := ModifyHeader or (TravelOrder."End Date" <> TravelOrderPlanLine."End Date");
            TravelOrder."End Date" := TravelOrderPlanLine."End Date";
        end;
        if ModifyHeader then
            TravelOrder.Modify(true);
    end;
}