codeunit 93202 "Oxygen Test PTE"
{
    Subtype = Test;

    // [FEATURE] [Oxigen Summit]

    #region Libraries
    var
        LibrarySales: Codeunit "Library - Sales";
        LibraryRandom: Codeunit "Library - Random";
        Assert: Codeunit "Assert";

    #endregion

    #region Shared Variables
    var
        OxygenSetupPTE: Record "Oxygen Setup PTE";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        IsInitialized: Boolean;
    #endregion

    [Test]
    procedure SalesDocument_OxygenIsSetTrue()
    begin
        // [SCENARIO #123] Test oxygen minimum is met
        Initialize();

        // [GIVEN] Set Setup
        OxygenSetupPTE."Min. Oxygen Quantity" := LibraryRandom.RandIntInRange(100, 200);

        // [WHEN] Set Sales Line Quanity more than Oxygen Quantity
        SalesLine.Quantity := OxygenSetupPTE."Min. Oxygen Quantity" + 1;
        SalesLine.SetOxygenPTE(OxygenSetupPTE);

        // [THEN] then
        Assert.IsTrue(SalesLine."Oxygen Summit PTE", 'Oxygen not set.');
    end;

    [Test]
    procedure SalesDocument_OxygenIsSetFalse()
    begin
        // [SCENARIO #123] Test oxygen minimum is met
        Initialize();

        // [GIVEN] Set Setup
        OxygenSetupPTE."Min. Oxygen Quantity" := LibraryRandom.RandIntInRange(100, 200);

        // [WHEN] Set Sales Line Quanity less than Oxygen Quantity
        SalesLine.Quantity := OxygenSetupPTE."Min. Oxygen Quantity" - 1;
        SalesLine.SetOxygenPTE(OxygenSetupPTE);

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
        Clear(OxygenSetupPTE);
    end;

    local procedure InitializeSharedFixtures()
    begin
        if IsInitialized then exit;

        LibrarySales.CreateSalesDocumentWithItem(SalesHeader, SalesLine, SalesHeader."Document Type"::Order, '', '', OxygenSetupPTE."Min. Oxygen Quantity" - 1, '', WorkDate());
    end;
}