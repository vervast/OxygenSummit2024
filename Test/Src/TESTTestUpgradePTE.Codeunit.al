codeunit 93201 "TEST Test Upgrade PTE"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        TESTInstall: Codeunit "TEST Install PTE";
    begin
        TESTInstall.SetupTestSuite();
    end;
}