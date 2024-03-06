tableextension 50000 "SalesLine Ext PTE" extends "Sales Line"
{
    fields
    {
        field(80000; "Oxygen Summit PTE"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    procedure SetOxygenPTE()
    var
        SetOxygenSLMethPTE: Codeunit "SetOxygen SL Meth PTE";
    begin
        SetOxygenSLMethPTE.SetOxygen(Rec);
    end;

    internal procedure SetOxygenPTE(OxygenSetupPTE: Record "Oxygen Setup PTE")
    var
        SetOxygenSLMethPTE: Codeunit "SetOxygen SL Meth PTE";
    begin
        SetOxygenSLMethPTE.SetOxygen(Rec, OxygenSetupPTE);
    end;
}