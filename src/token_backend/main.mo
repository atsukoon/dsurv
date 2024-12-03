import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

actor Token {
  var owner : Principal = Principal.fromText("o3oky-5ygyz-lcvvw-5wkdm-3hizo-hs25b-gfxrh-sbfly-v2igi-leqmj-pae");
  var totalSupply : Nat = 1000000000;
  var symbol : Text = "DATS";

  var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);
  balances.put(owner, totalSupply);

  public query func balanceOf(who : Principal) : async Nat {
    let balance : Nat = switch (balances.get(who)) {
      case null 0;
      case (?result) result;
    };
    return balance;
  };

  public query func getSymbol() : async Text {
    return symbol;
  }
};
