
PROJECTNAME = blink
VERILOGS = $(PROJECTNAME).v
SYNTHOUT = $(PROJECTNAME).json
PNROUT = $(PROJECTNAME).asc
BIN = $(PROJECTNAME).bin


synth : $(SYNTHOUT)

$(SYNTHOUT) : $(VERILOGS)
	yosys -q -p "synth_ice40 -top $(PROJECTNAME) -json $(SYNTHOUT)" $(VERILOGS)

pnr : $(PNROUT)

$(PNROUT) : $(SYNTHOUT) $(PROJECTNAME).pcf
	nextpnr-ice40 --force --json $^ --pcf $(PROJECTNAME).pcf --asc $@ --freq 12 --hx1k --package tq144 

bin : $(BIN)

$(BIN) : $(PNROUT)
	icepack $^ $@

load : $(BIN)
	openFPGALoader -b ice40_generic $^

clean :
	rm -rf $(SYNTHOUT) $(PNROUT) $(BIN)
