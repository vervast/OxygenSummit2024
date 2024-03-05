codeunit 93200 "TEST Install PTE"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        SetupTestSuite();
    end;

    procedure SetupTestSuite()
    var
        ALTestSuite: Record "AL Test Suite";
    begin
        CreateSuite('DEFAULT', '93200..93224');
        CreateSuite('DEFAULT01', '93225..93249');
        CreateSuite('DEFAULT02', '93250..93274');
        CreateSuite('DEFAULT03', '93275..93299');
        CreateSuite('DEFAULT04', '93300..93324');
        CreateSuite('DEFAULT05', '93325..93349');
        CreateSuite('DEFAULT06', '93350..93374');
        CreateSuite('DEFAULT07', '93375..93399');
        CreateSuite('DEFAULT08', '93400..93424');
        CreateSuite('DEFAULT09', '93425..93999');

        ALTestSuite.GET('DEFAULT');
    end;

    local procedure CreateSuite(SuiteName: Text; ObjectFilter: Text)
    var
        ALTestSuite: Record "AL Test Suite";
        TestSuiteMgt: Codeunit "Test Suite Mgt.";
        SuiteNameCode: Code[10];
    begin
        Evaluate(SuiteNameCode, CopyStr(SuiteName, 1, MaxStrLen(SuiteNameCode)));
        //Delete Suite if necessary
        if ALTestSuite.Get(SuiteName) then
            ALTestSuite.Delete(true);
        //Create Suite
        TestSuiteMgt.CreateTestSuite(SuiteNameCode);
        ALTestSuite.Get(SuiteName);
        //Insert codeunits        

        // Important Change! up until v17.0: 
        // TestSuiteMgt.SelectTestMethodsByExtension(ALTestSuite, AppId);
        // From v18.0:
        TestSuiteMgt.SelectTestMethodsByRange(ALTestSuite, ObjectFilter);
    end;
}