table 50100 "Travel Order"
{
    Caption = 'Travel Order';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Travel Orders";
    LookupPageId = "Travel Orders";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                HRSetup: Record "Human Resources Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(GetNoSeriesCode());
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Status; Option)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            OptionCaption = 'Open,Planned,Pending Plan Approval,Released,Pending Cost Approval,Finished';
            OptionMembers = Open,Planned,PlanApproval,Released,CostApproval,Finished;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Search Description" := Description;
            end;
        }
        field(4; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
            DataClassification = CustomerContent;
        }
        field(5; "Creation Date"; DateTime)
        {
            Caption = 'Creation Date';
            DataClassification = CustomerContent;
        }
        field(6; "Last Date Modified"; DateTime)
        {
            Caption = 'Last Date Modified';
            DataClassification = CustomerContent;
        }
        field(7; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            DataClassification = CustomerContent;
            TableRelation = Employee;
            ValidateTableRelation = true;

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                Employee.Get("Employee No.");
                "Employee Name" := Employee.FullName();
            end;
        }
        field(8; "Start Date"; DateTime)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(9; "End Date"; DateTime)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
        }
        field(10; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User ID';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'Number Series';
            DataClassification = CustomerContent;
        }
        field(12; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Cronological; "Start Date")
        {

        }
        key(ByEmployees; "Employee No.", "Start Date")
        {

        }
    }

    trigger OnInsert()
    var
        TravelMgt: Codeunit "Travel Management";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then
            NoSeriesMgt.InitSeries(TravelMgt.GetNoSeriesCode(), xRec."No. Series", 0D, "No.", "No. Series");
    end;

    procedure GetNoSeriesCode(): Code[20]
    var
        TravelMgt: Codeunit "Travel Management";
    begin
        exit(TravelMgt.GetNoSeriesCode());
    end;

    procedure AssistEdit(OldSalesHeader: Record "Travel Order"): Boolean
    var
        TravelOrder: Record "Travel Order";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TravelOrederExistsErr: Label 'Travel order %1 already exists.';
    begin
        if NoSeriesMgt.SelectSeries(GetNoSeriesCode(), OldSalesHeader."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            if TravelOrder.Get("No.") then
                Error(TravelOrederExistsErr, "No.");
            exit(true);
        end;
    end;
}
