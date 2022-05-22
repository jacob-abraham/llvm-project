
let Namespace = "SethISA" in {

class SethISAReg<bits<3> Enc, string n, list<string> alt = []> : Register<n> {
  let HWEncoding{1-0} = Enc;
  let AltNames = alt;
}
}

foreach Index = 0-7 in {
  def R#Index : SethISAReg<Index, "R"#Index, ["R"#Index]>, DwarfRegNum<[Index]>;
}
def GPR : RegisterClass<"SethISA", [i8], 8, (add (sequence "R%u", 1, 7))> {
  let RegInfos = XLenRI;
}
def SP : RegisterClass<"SethISA", [i8], 8, (add R0)> {
  let RegInfos = XLenRI;
}


