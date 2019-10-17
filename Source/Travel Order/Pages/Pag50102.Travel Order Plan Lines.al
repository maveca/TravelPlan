page 50102 "Travel Order Plan Lines"
{

    PageType = ListPart;
    SourceTable = "Travel Order Plan Line";
    Caption = 'Travel Order Plan Lines';
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Activity No."; "Activity No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Departure Location Code"; "Departure Location Code")
                {
                    ApplicationArea = All;
                }
                field("Departure Location Name"; "Departure Location Name")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = All;
                }
                field(Duration; Duration)
                {
                    ApplicationArea = All;
                    Caption = 'Travel Druartion';
                }
                field("Arrival Location Code"; "Arrival Location Code")
                {
                    ApplicationArea = All;
                }
                field("Arrival Location Name"; "Arrival Location Name")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = All;
                }
                field(Comment; Comment)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(NextLineDuration; GetNextLineDuration())
                {
                    ApplicationArea = All;
                    Caption = 'Waiting Duration';
                }

            }
        }
    }

    trigger OnModifyRecord(): Boolean
    var
        TravelMgt: Codeunit "Travel Management";
    begin
        TravelMgt.UpdateHeaderFromPlanLines("Travel Order No.");
        CurrPage.Update(false);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if xRec."Line No." <> 0 then begin
            "Start Date" := xRec."End Date";
            if xRec."Arrival Location Code" <> '' then
                "Departure Location Code" := xRec."Arrival Location Code"
            else
                "Departure Location Code" := xRec."Departure Location Code";
        end;
    end;
}
