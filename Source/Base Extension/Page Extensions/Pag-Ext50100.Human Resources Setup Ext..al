pageextension 50100 "Human Resources Setup Ext." extends "Human Resources Setup"
{
    layout
    {
        addlast(Numbering)
        {
            field("Travel Order Nos."; "Travel Order Nos.")
            {
                ApplicationArea = All;
            }
        }
    }
}
