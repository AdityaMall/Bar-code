tableextension 50110 LinePageExt extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                Rec_ILE: Record "Item Ledger Entry";
                Rec_SalesLine: Record "Sales Line";
                ItemNo: Text;


            begin
                ItemNo := '';
                ItemNo := rec."No.";

                Rec_ILE.Reset();
                Rec_ILE.SetRange("Entry Type", Rec_ILE."Entry Type"::Purchase);
                Rec_ILE.SetRange("Item Tracking", Rec_ILE."Item Tracking"::"Serial No.");
                Rec_ILE.SetFilter("Serial No.", '%1', Rec."No.");

                if Rec_ILE.FindFirst() then begin
                    Validate(rec."No.", Rec_ILE."Item No.");

                    if rec.Quantity = 0 then
                        Validate(rec.Quantity, 1)
                    else
                        Validate(rec.Quantity, rec.Quantity + 1);
                end;

            end;

            trigger OnAfterValidate()
            var
                myInt: Integer;
                Rec_ILE: Record "Item Ledger Entry";
                Rec_SalesLine: Record "Sales Line";

            begin
                Rec_ILE.Reset();
                Rec_ILE.SetRange("Entry Type", Rec_ILE."Entry Type"::Purchase);
                Rec_ILE.SetRange("Item Tracking", Rec_ILE."Item Tracking"::"Serial No.");
                Rec_ILE.SetFilter("Serial No.", '%1', Rec."No.");

                if Rec_ILE.FindFirst() then begin
                    rec.Validate("Location Code", Rec_ILE."Location Code");
                end;


            end;
        }
    }

    var
        myInt: Integer;
}