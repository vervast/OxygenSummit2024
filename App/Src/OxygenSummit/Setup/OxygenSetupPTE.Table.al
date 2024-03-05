table 50000 "Oxygen Setup PTE"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Min. Oxygen Quantity"; Integer)
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