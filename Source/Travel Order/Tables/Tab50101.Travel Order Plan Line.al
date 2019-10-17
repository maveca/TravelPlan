table 50101 "Travel Order Plan Line"
{
    Caption = 'Travel Order Plan Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Travel Order No."; Code[20])
        {
            Caption = 'Travel Order No.';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Activity No."; Code[20])
        {
            Caption = 'Activity No.';
            DataClassification = CustomerContent;
            TableRelation = "Travel Activity";
        }
        field(4; Description; Text[80])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(5; "Start Date"; DateTime)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if Duration > 0 then
                    "End Date" := "Start Date" + Duration;
                Validate(Duration);
            end;
        }
        field(6; "End Date"; DateTime)
        {
            Caption = 'End Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Validate(Duration);
            end;
        }
        field(7; Duration; Duration)
        {
            Caption = 'Travel Duration';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                DurationErr: Label 'Duration can not be negative.';
            begin
                if (xRec.Duration <> Duration) and (Duration <> 0) then begin
                    if not ("Start Date" = CreateDateTime(0D, 0T)) then
                        "End Date" := "Start Date" + Duration
                    else
                        if not ("End Date" = CreateDateTime(0D, 0T)) then
                            "Start Date" := "End Date" - Duration;
                end else
                    if not (("Start Date" = CreateDateTime(0D, 0T)) or ("End Date" = CreateDateTime(0D, 0T))) then
                        Duration := "End Date" - "Start Date"
                    else
                        Duration := 0;
                if Duration < 0 then
                    Error(DurationErr);
            end;
        }
        field(8; Comment; Text[250])
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
        }
        field(9; "Departure Location Code"; Code[20])
        {
            Caption = 'Departure Code';
            DataClassification = CustomerContent;
            TableRelation = "Travel Location";
            trigger OnValidate()
            var
                TravelLocation: Record "Travel Location";
            begin
                if TravelLocation.Get("Departure Location Code") then
                    "Departure Location Name" := TravelLocation.Name;
            end;
        }
        field(10; "Departure Location Name"; Text[50])
        {
            Caption = 'Departure Name';
            DataClassification = CustomerContent;
        }
        field(11; "Arrival Location Code"; Code[20])
        {
            Caption = 'Arrival';
            DataClassification = CustomerContent;
            TableRelation = "Travel Location";
            trigger OnValidate()
            var
                TravelLocation: Record "Travel Location";
            begin
                if TravelLocation.Get("Arrival Location Code") then
                    "Arrival Location Name" := TravelLocation.Name;
            end;
        }
        field(12; "Arrival Location Name"; Text[50])
        {
            Caption = 'Departure Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Travel Order No.", "Line No.")
        {
            Clustered = true;
        }
        key(Cronological; "Travel Order No.", "Start Date")
        {

        }
    }
    procedure GetNextLineDuration(): Duration
    var
        NextLine: Record "Travel Order Plan Line";
    begin
        NextLine.Copy(Rec);
        NextLine.SetCurrentKey("Travel Order No.", "Start Date");

        if (NextLine.Next() = 0) OR (NextLine."Start Date" = CreateDateTime(0D, 0T)) OR ("End Date" = CreateDateTime(0D, 0T)) then
            exit(0)
        else
            exit(NextLine."Start Date" - "End Date");
    end;
}
