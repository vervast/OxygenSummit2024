codeunit 50001 "SetOxygen SL Meth PTE"
{
    internal procedure SetOxygen(var SalesLine: Record "Sales Line")
    var
        IsHandled: Boolean;
    begin
        OnBeforeSetOxygen(SalesLine, IsHandled);

        DoSetOxygen(SalesLine, IsHandled);

        OnAfterSetOxygen(SalesLine);
    end;

    local procedure DoSetOxygen(var SalesLine: Record "Sales Line"; IsHandled: Boolean)
    var
        OxygenSetupPTE: Record "Oxygen Setup PTE";
    begin
        if IsHandled then
            exit;

        // Do Some Fancy Stuff
        OxygenSetupPTE.SetLoadFields("Min. Oxygen Quantity");
        if not OxygenSetupPTE.Get() then
            exit;

        SalesLine."Oxygen Summit PTE" := SalesLine.Quantity >= OxygenSetupPTE."Min. Oxygen Quantity";

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSetOxygen(var SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetOxygen(var SalesLine: Record "Sales Line")
    begin
    end;
}