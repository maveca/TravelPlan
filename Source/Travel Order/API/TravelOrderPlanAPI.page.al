page 50105 "Travel Order Plan API"
{
    
    PageType = API;
    SourceTable = "Travel Order Plan Line";
    APIPublisher = 'demoAPIPublisher';
    APIGroup = 'apiGroup';
    APIVersion = 'v1.0';
    EntityName = 'travelOrderPlanLine';
    EntitySetName = 'travelOrderPlanLines';
    DelayedInsert = true;
    Caption = 'TravelOrderPlanAPI';
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(activityNo; "Activity No.")
                {
                    Caption = 'ActivityNo';
                    ApplicationArea = All;
                }
                field(arrivalLocationCode; "Arrival Location Code")
                {
                    Caption = 'ArrivalLocationCode';
                    ApplicationArea = All;
                }
                field(arrivalLocationName; "Arrival Location Name")
                {
                    Caption = 'ArrivalLocationName';
                    ApplicationArea = All;
                }
                field(arrivalTimeBuffer; "Arrival Time Buffer")
                {
                    Caption = 'ArrivalTimeBuffer';
                    ApplicationArea = All;
                }
                field(departureLocationCode; "Departure Location Code")
                {
                    Caption = 'DepartureLocationCode';
                    ApplicationArea = All;
                }
                field(departureLocationName; "Departure Location Name")
                {
                    Caption = 'DepartureLocationName';
                    ApplicationArea = All;
                }
                field(departureTimeBuffer; "Departure Time Buffer")
                {
                    Caption = 'DepartureTimeBuffer';
                    ApplicationArea = All;
                }
                field(endDate; "End Date")
                {
                    Caption = 'EndDate';
                    ApplicationArea = All;
                }
                field(lineNo; "Line No.")
                {
                    Caption = 'LineNo';
                    ApplicationArea = All;
                }
                field(startDate; "Start Date")
                {
                    Caption = 'StartDate';
                    ApplicationArea = All;
                }
                field(travelOrderNo; "Travel Order No.")
                {
                    Caption = 'TravelOrderNo';
                    ApplicationArea = All;
                }
                field(comment; Comment)
                {
                    Caption = 'Comment';
                    ApplicationArea = All;
                }
                field(description; Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }
                field(duration; Duration)
                {
                    Caption = 'Duration';
                    ApplicationArea = All;
                }
                field(systemId; SystemId)
                {
                    Caption = 'SystemId';
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
