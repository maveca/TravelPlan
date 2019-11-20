tableextension 50100 "Human Resources Setup Ext." extends "Human Resources Setup"
{
    fields
    {
        field(50100; "Travel Order Nos."; Code[20])
        {
            Caption = 'Travel Order Number Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            ValidateTableRelation = true;
        }
    }
}
