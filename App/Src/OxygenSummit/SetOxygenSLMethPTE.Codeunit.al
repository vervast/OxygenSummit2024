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
    begin
        if IsHandled then
            exit;

        // Do Some Fancy Stuff

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