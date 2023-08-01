// Test the order between these two calls:
//
// 1. A virtual function called in parent's new.
// 2. Initialization of a member variable in the child class.

class Base;
  function new();
    this.get_plusarg();
  endfunction : new

  // func: get_plusarg
  virtual function void get_plusarg();
  endfunction : get_plusarg

  // func: print
  virtual function void print();
  endfunction : print
endclass

class Child extends Base;

  int my_value = 3;

  function new();
    super.new();
  endfunction : new

  // func: get_plusarg
  virtual function void get_plusarg();
    void'($value$plusargs("my_value=%0d", this.my_value));
    this.print();
  endfunction : get_plusarg

  // func: print
  virtual function void print();
    $display("my_value is %0d", this.my_value);
  endfunction : print
endclass


module order ();
  initial begin
    Child c = new();
    c.print();
  end
endmodule
