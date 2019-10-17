page 50104 "Travel Activities"
{

    PageType = List;
    SourceTable = "Travel Activity";
    Caption = 'Travel Activities';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field("Activity Type"; "Activity Type")
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field("Departure Time Buffer"; "Departure Time Buffer")
                {
                    ApplicationArea = All;
                }
                field("Arrival Time Buffer"; "Arrival Time Buffer")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
