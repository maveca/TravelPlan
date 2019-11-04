table 50103 "Travel Activity"
{
    Caption = 'Travel Activity';
    DataClassification = ToBeClassified;
    LookupPageId = "Travel Activities";
    DrillDownPageId = "Travel Activities";

    fields
    {
        field(1; Code; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "Activity Type"; Option)
        {
            Caption = 'Activity Type';
            DataClassification = CustomerContent;
            OptionMembers = " ",Transport,Accomodation;
            OptionCaption = ' ,Transport,Accomodation';
        }
        field(4; "Departure Time Buffer"; Duration)
        {
            Caption = 'Minimum Departure Time Buffer';
            DataClassification = CustomerContent;
        }
        field(5; "Arrival Time Buffer"; Duration)
        {
            Caption = 'Safe Arrival Time Buffer';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

}
