// Test the cast to nonexisting queue index.

class Base;
  function new();
  endfunction : new

  // func: print
  virtual function void print();
    $display("Base");
  endfunction : print
endclass

class Child extends Base;
  function new();
    super.new();
  endfunction : new

  // func: print
  virtual function void print();
    $display("Child");
  endfunction : print
endclass


module casting();
  initial begin
    Base list[$];
    for (int idx = 0; idx < 5; idx++) begin
      Child c = new();
      $cast(list[idx], c);
    end
    foreach (list[idx]) begin
      list[idx].print();
    end
  end
endmodule
