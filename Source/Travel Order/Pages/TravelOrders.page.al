page 50100 "Travel Orders"
{

    PageType = List;
    SourceTable = "Travel Order";
    Caption = 'Travel Orders';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Travel Order";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Employee No."; "Employee No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
