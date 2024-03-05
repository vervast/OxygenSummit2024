codeunit 50001 "SetOxygen SL Meth PTE"
{
    internal procedure SetOxygen(var SalesLine: Record "Sales Line"; OxygenSetupPTE: Record "Oxygen Setup PTE")
    var
        IsHandled: Boolean;
    begin
        OnBeforeSetOxygen(SalesLine, OxygenSetupPTE, IsHandled);

        DoSetOxygen(SalesLine, OxygenSetupPTE, IsHandled);

        OnAfterSetOxygen(SalesLine, OxygenSetupPTE);
    end;

    local procedure DoSetOxygen(var SalesLine: Record "Sales Line"; OxygenSetupPTE: Record "Oxygen Setup PTE"; IsHandled: Boolean)
    begin
        if IsHandled then
            exit;

        SalesLine."Oxygen Summit PTE" := SalesLine.Quantity >= OxygenSetupPTE."Min. Oxygen Quantity";

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSetOxygen(var SalesLine: Record "Sales Line"; OxygenSetupPTE: Record "Oxygen Setup PTE"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetOxygen(var SalesLine: Record "Sales Line"; OxygenSetupPTE: Record "Oxygen Setup PTE")
    begin
    end;
}