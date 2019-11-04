page 50101 "Travel Order"
{

    PageType = Document;
    SourceTable = "Travel Order";
    Caption = 'Travel Order';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Employee No."; "Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Search Description"; "Search Description")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Start Date"; "Start Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    Editable = False;
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                    ApplicationArea = All;
                }
            }
            part(PlanLines; "Travel Order Plan Lines")
            {
                Caption = 'Planning Lines';
                ApplicationArea = Basic, Suite;
                SubPageLink = "Travel Order No." = FIELD("No.");
                UpdatePropagation = Both;
            }
        }
    }
}
