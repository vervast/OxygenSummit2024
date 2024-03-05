codeunit 80000 "Oxygen Subscribers PTE"
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure OnAfterValidateQuantity(var Rec: Record "Sales Line")
    begin
        Rec.SetOxygenPTE();
    end;

}