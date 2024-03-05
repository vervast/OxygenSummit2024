page 50000 "Oxygen Setup PTE"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Oxygen Setup PTE";

    layout
    {
        area(Content)
        {
            group(Group01)
            {

                field("Min. Oxygen Quantity"; Rec."Min. Oxygen Quantity")
                {
                    ToolTip = 'Specifies the value of the Min. Oxygen Quantity field.';
                }
            }
        }
    }
}