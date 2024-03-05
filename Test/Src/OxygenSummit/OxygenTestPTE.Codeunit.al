codeunit 93202 "Oxygen Test PTE"
{
    Subtype = Test;

    // [FEATURE] [Oxigen Summit]

    var
        IsInitialized: Boolean;

    [Test]
    procedure SalesDocument_OxygenIsSetTrue()
    var
        OxygenSetupPTE: Record "Oxygen Setup PTE";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        LibrarySales: Codeunit "Library - Sales";
        LibraryRandom: Codeunit "Library - Random";
        Assert: Codeunit "Assert";
    begin
        // [SCENARIO #123] Test oxygen minimum is met
        Initialize();
        // [GIVEN] Create Setup
        if not OxygenSetupPTE.Get('') then
            OxygenSetupPTE.Insert();
        OxygenSetupPTE."Min. Oxygen Quantity" := LibraryRandom.RandIntInRange(100, 200);
        OxygenSetupPTE.Modify();

        // [WHEN] Create Sales Document with More than Oxigen Quantity
        LibrarySales.CreateSalesDocumentWithItem(SalesHeader, SalesLine, SalesHeader."Document Type"::Order, '', '', OxygenSetupPTE."Min. Oxygen Quantity" + 1, '', WorkDate());

        // [THEN] then
        Assert.IsTrue(SalesLine."Oxygen Summit PTE", 'Oxygen not set.');
    end;

    [Test]
    procedure SalesDocument_OxygenIsSetFalse()
    var
        OxygenSetupPTE: Record "Oxygen Setup PTE";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        LibrarySales: Codeunit "Library - Sales";
        LibraryRandom: Codeunit "Library - Random";
        Assert: Codeunit "Assert";
    begin
        // [SCENARIO #123] Test oxygen minimum is met
        Initialize();
        // [GIVEN] Create Setup
        if not OxygenSetupPTE.Get('') then
            OxygenSetupPTE.Insert();
        OxygenSetupPTE."Min. Oxygen Quantity" := LibraryRandom.RandIntInRange(100, 200);
        OxygenSetupPTE.Modify();

        // [WHEN] Create Sales Document with More than Oxigen Quantity
        LibrarySales.CreateSalesDocumentWithItem(SalesHeader, SalesLine, SalesHeader."Document Type"::Order, '', '', OxygenSetupPTE."Min. Oxygen Quantity" - 1, '', WorkDate());

        // [THEN] then
        Assert.IsFalse(SalesLine."Oxygen Summit PTE", 'Oxygen is set.');
    end;

    local procedure Initialize()
    var
        LibraryTestInitialize: Codeunit "Library - Test Initialize";
    begin
        LibraryTestInitialize.OnTestInitialize(Codeunit::"Oxygen Test PTE");

        InitializeSharedFixtures();
        InitializeFreshFixtures();

        if IsInitialized then exit;

        LibraryTestInitialize.OnBeforeTestSuiteInitialize(Codeunit::"Oxygen Test PTE");

        IsInitialized := true;
        Commit();
        LibraryTestInitialize.OnAfterTestSuiteInitialize(Codeunit::"Oxygen Test PTE");
    end;

    local procedure InitializeFreshFixtures()
    begin

    end;

    local procedure InitializeSharedFixtures()
    begin
        if IsInitialized then exit;

    end;
}