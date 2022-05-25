import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor IDBS {
  stable var currentValue: Float = 300;
  // currentValue := 300;
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 2343425345345;
  // Debug.print(debug_show(currentValue));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }
    
    else {Debug.print("Invalid number Boss")
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  // topUp();

  public func compound() {
    let currentTime = Time.now();
    let timeElapNS = currentTime - startTime;
    let timeElapS = timeElapNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapS));
    startTime := currentTime;
  }
}
