pageextension 50000 "SalesOrderSubform Ext PTE" extends "Sales Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Oxygen Summit PTE"; Rec."Oxygen Summit PTE")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Oxygen Summit PTE field.';
            }
        }
    }
}