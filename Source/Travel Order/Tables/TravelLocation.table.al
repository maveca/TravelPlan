table 50102 "Travel Location"
{
    Caption = 'Travel Location';
    DataClassification = CustomerContent;
    LookupPageId = "Travel Locations";
    DrillDownPageId = "Travel Locations";

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
            DataClassification = CustomerContent;
        }
        field(4; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }
        field(5; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = CustomerContent;
        }
        field(6; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed());
                Validate("Country/Region Code");
            end;

            trigger OnLookup()
            var
                PostCode: Record "Post Code";
                CityTxt: Text;
                CountyTxt: Text;
            begin
                CityTxt := City;
                CountyTxt := County;
                PostCode.LookupPostCode(CityTxt, "Post Code", CountyTxt, "Country/Region Code");
                City := COPYSTR(CityTxt, 1, MaxStrLen(City));
                County := COPYSTR(CountyTxt, 1, MaxStrLen(County));
                Validate("Country/Region Code");
            end;
        }
        field(7; City; Text[30])
        {
            Caption = 'City';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed());
                Validate("Country/Region Code");
            end;
        }
        field(8; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";

            trigger OnValidate()
            var
                PostCode: Record "Post Code";
                CountryRegion: Record "Country/Region";
            begin
                if CountryRegion.Get("Country/Region Code") then
                    Country := CopyStr(CountryRegion.Name, 1, MaxStrLen(Country));
                PostCode.ValidateCountryCode(City, "Post Code", County, "Country/Region Code");
            end;
        }
        field(9; Country; Text[30])
        {
            Caption = 'Country';
            DataClassification = CustomerContent;
        }
        field(10; County; Text[30])
        {
            Caption = 'County';
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
