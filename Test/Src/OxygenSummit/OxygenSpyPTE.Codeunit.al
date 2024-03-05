codeunit 93203 "OxygenSpy PTE"
{
    EventSubscriberInstance = Manual;

    var
        IsCalled: Boolean;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"SetOxygen SL Meth PTE", 'OnBeforeSetOxygen', '', false, false)]
    local procedure SetOxygenSLMethPTE_OnBeforeSetOxygen(var IsHandled: Boolean)
    begin
        IsCalled := true;
        IsHandled := true;
    end;

    procedure GetIsCalled(): Boolean;
    begin
        exit(IsCalled);
    end;
}