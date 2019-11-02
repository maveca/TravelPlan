page 50105 "Travel Order Plan API"
{
    
    PageType = API;
    SourceTable = "Travel Order Plan Line";
    APIPublisher = 'APIPublisher';
    APIGroup = 'apiGroup';
    APIVersion = 'v1.0';
    EntityName = 'TravelOrderPlanLine';
    EntitySetName = 'TravelOrderPlanLines';
    DelayedInsert = true;
    Caption = 'TravelOrderPlanAPI';
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ActivityNo; "Activity No.")
                {
                    Caption = 'ActivityNo';
                    ApplicationArea = All;
                }
                field(ArrivalLocationCode; "Arrival Location Code")
                {
                    Caption = 'ArrivalLocationCode';
                    ApplicationArea = All;
                }
                field(ArrivalLocationName; "Arrival Location Name")
                {
                    Caption = 'ArrivalLocationName';
                    ApplicationArea = All;
                }
                field(ArrivalTimeBuffer; "Arrival Time Buffer")
                {
                    Caption = 'ArrivalTimeBuffer';
                    ApplicationArea = All;
                }
                field(DepartureLocationCode; "Departure Location Code")
                {
                    Caption = 'DepartureLocationCode';
                    ApplicationArea = All;
                }
                field(DepartureLocationName; "Departure Location Name")
                {
                    Caption = 'DepartureLocationName';
                    ApplicationArea = All;
                }
                field(DepartureTimeBuffer; "Departure Time Buffer")
                {
                    Caption = 'DepartureTimeBuffer';
                    ApplicationArea = All;
                }
                field(EndDate; "End Date")
                {
                    Caption = 'EndDate';
                    ApplicationArea = All;
                }
                field(LineNo; "Line No.")
                {
                    Caption = 'LineNo';
                    ApplicationArea = All;
                }
                field(StartDate; "Start Date")
                {
                    Caption = 'StartDate';
                    ApplicationArea = All;
                }
                field(TravelOrderNo; "Travel Order No.")
                {
                    Caption = 'TravelOrderNo';
                    ApplicationArea = All;
                }
                field(Comment; Comment)
                {
                    Caption = 'Comment';
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }
                field(Duration; Duration)
                {
                    Caption = 'Duration';
                    ApplicationArea = All;
                }
                field(SystemId; SystemId)
                {
                    Caption = 'SystemId';
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
