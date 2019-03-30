rm -f Asali*

source /usr/local/bin/setup_cantera

export CANTERA=/usr/local/

export ASALI_OS='-DASALI_ON_WINDOW=0'

rm -f obj
mkdir obj

# Properties
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/transportProperties.C -o obj/transportProperties.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/thermoProperties.C -o obj/thermoProperties.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/thermoTransportProperties.C -o obj/thermoTransportProperties.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/vacuumProperties.C -o obj/vacuumProperties.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/equilibriumCalculator.C -o obj/equilibriumCalculator.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# Cantera Interface
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/canteraInterface.C -o obj/canteraInterface.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# Species popup
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/speciesPopup.C -o obj/speciesPopup.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# Asali properties
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/asaliProperties.C -o obj/asaliProperties.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# Asali catalytic properties
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/asaliCatalystProperties.C -o obj/asaliCatalystProperties.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# Run bar
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/runBar.C -o obj/runBar.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# Asali plot
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/asaliPlot.C -o obj/asaliPlot.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# Asali kinetic maker
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/asaliKineticMaker.C -o obj/asaliKineticMaker.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# Chemkin converter
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/chemkinConverter.C -o obj/chemkinConverter.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# Pressure drops
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/pressureDrops.C -o obj/pressureDrops.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# main
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/main.cpp -o obj/main.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`

# Python interface
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/pythonInterface.C -o obj/pythonInterface.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`

# Asali
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/Asali.C -o obj/Asali.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`

# Catalytic Reactors
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/catalyticReactors.C -o obj/catalyticReactors.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/catalyticReactorsEquations.C -o obj/catalyticReactorsEquations.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`

# Batch
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/batchReactor.C -o obj/batchReactor.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/batchEquations.C -o obj/batchEquations.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`

# Cstr
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/cstrReactor.C -o obj/cstrReactor.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/cstrEquations.C -o obj/cstrEquations.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`

# Ph1D
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/ph1dReactor.C -o obj/ph1dReactor.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/ph1dEquations.C -o obj/ph1dEquations.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`

# Het1d
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/het1dReactor.C -o obj/het1dReactor.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/het1dEquations.C -o obj/het1dEquations.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`

# Catalytic Pellet
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/catalyticPellet.C -o obj/catalyticPellet.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/catalyticPelletEquations.C -o obj/catalyticPelletEquations.o -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib  `pkg-config gtkmm-3.0 --cflags --libs` `python-config --cflags`

# Linear Regression
g++ -Os -s -std=c++11 $ASALI_OS -pthread -c src/linearRegression.C -o obj/linearRegression.o -Isrc/ -I$CANTERA/include/cantera/ext/ -I$CANTERA/include  -L$CANTERA/lib   `pkg-config gtkmm-3.0 --cflags --libs` 

# Make all
g++ -Os -s -std=c++11 $ASALI_OS obj/Asali.o obj/main.o obj/transportProperties.o obj/thermoProperties.o obj/thermoTransportProperties.o obj/vacuumProperties.o obj/equilibriumCalculator.o obj/catalyticReactors.o obj/catalyticReactorsEquations.o obj/batchEquations.o obj/batchReactor.o obj/ph1dEquations.o obj/ph1dReactor.o obj/het1dEquations.o obj/het1dReactor.o obj/cstrEquations.o obj/cstrReactor.o obj/canteraInterface.o obj/speciesPopup.o obj/asaliProperties.o obj/asaliCatalystProperties.o obj/runBar.o obj/asaliPlot.o obj/chemkinConverter.o obj/pressureDrops.o obj/linearRegression.o obj/catalyticPellet.o obj/catalyticPelletEquations.o obj/asaliKineticMaker.o obj/pythonInterface.o -o Asali -Isrc/ -I$CANTERA/include/cantera/ext -I$CANTERA/include -L$CANTERA/lib `python-config --cflags --libs` `pkg-config gtkmm-3.0 --cflags --libs` -Wl,--start-group -lcantera -lcantera_fortran -Wl,--end-group -lgfortran -Wl,--no-as-needed -lpthread -lm
