table 80002 "Oxygen Setup PTE"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Min. Oxygen Quantity"; Decimal)
        {
            Caption = 'Min. Oxygen Quantity';
        }

    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}