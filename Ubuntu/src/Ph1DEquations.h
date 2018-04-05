/*##############################################################################################
#                                                                                              #
#     #############       #############       #############       ####                ####     #
#    #             #     #             #     #             #     #    #              #    #    #
#    #    #####    #     #    #########      #    #####    #     #    #              #    #    #
#    #    #   #    #     #    #              #    #   #    #     #    #              #    #    #
#    #    #####    #     #    #              #    #####    #     #    #              #    #    #
#    #             #     #    #########      #             #     #    #              #    #    #
#    #             #     #             #     #             #     #    #              #    #    #
#    #    #####    #      #########    #     #    #####    #     #    #              #    #    #
#    #    #   #    #              #    #     #    #   #    #     #    #              #    #    #
#    #    #   #    #      #########    #     #    #   #    #     #    #########      #    #    #
#    #    #   #    #     #             #     #    #   #    #     #             #     #    #    #
#     ####     ####       #############       ####     ####       #############       ####     #
#                                                                                              #
#   Department of Energy                                                                       #
#   Politecnico di Milano                                                                      #
#   Author: Stefano Rebughini <stefano.rebughini@polimi.it>                                    #
#                                                                                              #
################################################################################################
#                                                                                              #
#   License                                                                                    #
#                                                                                              #
#   This file is part of ASALI.                                                                #
#                                                                                              #
#   ASALI is free software: you can redistribute it and/or modify                              #
#   it under the terms of the GNU General Public License as published by                       #
#   the Free Software Foundation, either version 3 of the License, or                          #
#   (at your option) any later version.                                                        #
#                                                                                              #
#   ASALI is distributed in the hope that it will be useful,                                   #
#   but WITHOUT ANY WARRANTY; without even the implied warranty of                             #
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                              #
#   GNU General Public License for more details.                                               #
#                                                                                              #
#   You should have received a copy of the GNU General Public License                          #
#   along with ASALI. If not, see <http://www.gnu.org/licenses/>.                              #
#                                                                                              #
##############################################################################################*/

#ifndef PH1DEQUATIONS_H
#define PH1DEQUATIONS_H

#include <gtkmm.h>
#include <string>
#include <iostream>
#include <iomanip>
#include <math.h>
#include <ctime>
#include <sstream>
#include <fstream>
#include <stdlib.h>
#include <vector>
#include <algorithm>
#include <limits>

// Cantera
#include "cantera/Interface.h"
#include "cantera/thermo.h"
#include "cantera/transport.h"
#include "cantera/kinetics.h"

namespace ASALI
{
class Ph1DEquations
{
    public:

        Ph1DEquations();

        #include "vector.H"

        void setCanteraThermo(Cantera::ThermoPhase*    gas);
        
        void setCanteraInterface(Cantera::Interface*   surface);
        
        void setCanteraKinetics(Cantera::Kinetics*    kinetic);
        
        void setCanteraTransport(Cantera::Transport*    transport);

        void setHomogeneusReactions(const bool flag)    {homogeneusReactions_   = flag;}

        void setHeterogeneusReactions(const bool flag)  {heterogeneusReactions_ = flag;}
        
        void setEnergy(const bool flag)                 {energyEquation_        = flag;}

        void setLength(const double L);
        
        void setSpecificMassFlowRate(const double G);
        
        void setAsaliKinetic(const unsigned int                           NR,
                             const std::vector<double>                    k,
                             const std::vector<double>                    Eatt,
                             const std::vector<double>                    n,
                             const std::vector<double>                    a,
                             const std::vector<double>                    b,
                             const std::vector<int>                       index1,
                             const std::vector<int>                       index2,
                             const std::vector<int>                       canteraIndex,
                             const std::vector<std::vector<std::string> > name,
                             const std::vector<std::vector<int> >         stoich,
                             const double converter);

        void setPressure(const double P);

        void setTemperature(const double T);
        
        void setCatalystLoad(const double alfa);
        
        void setResolutionType(const std::string resolution);
        
        void setKineticType(const std::string type);
        
        void turnOnUserDefined(const bool check);

        void set_QfromSurface(const std::vector<double> Q);
        
        void set_MW(const std::vector<double> MW);
        
        void set_diff(const std::vector<double> diff);
        
        void set_cp(const double cp);
        
        void set_cond(const double cond);
        
        void setInletConditions(const std::vector<double> omega0, const double T0);
        
        void setIntegrationTime(const double tF);
        
        void setNumberOfPoints(const double NP);
        
        void resize();
        
        void store(const double tf,const std::vector<double> xf);

        std::vector<double> getLength()      const {return Length_;};
        std::vector<double> getTime()        const {return Time_;};
        std::vector<double> getPressure()    const {return Pressure_;};
        std::vector<double> getTemperature() const {return Temperature_;};

        std::vector<std::vector<double> > getSpecie()      const {return Specie_;};
        std::vector<std::vector<double> > getSite()        const {return Site_;};

        std::vector<std::vector<double> > getTemperatureTransient() const {return TemperatureTransient_;};

        std::vector<std::vector<std::vector<double> > > getSpecieTransient()      const {return SpecieTransient_;};
        std::vector<std::vector<std::vector<double> > > getSiteTransient()        const {return SiteTransient_;};


        unsigned int NumberOfEquations()     const {return NE_;};

        int Equations(double& t, std::vector<double>& y, std::vector<double>& dy);
        
        std::vector<bool> AlgebraicEquations() const {return algb_;};

    private:

        double MWmix_;
        double cTot_;
        double rho_;
        double P_;
        double T_;
        double L_;
        double G_;
        double alfa_;
        double QfromGas_;
        double QfromSurface_;
        double SD_;
        double cp_;
        double T0_;
        double dz_;
        double cond_;
        
        unsigned int NC_;
        unsigned int SURF_NC_;
        unsigned int NE_;
        unsigned int NP_;

        std::string resolution_;
        std::string type_;

        bool homogeneusReactions_ ;
        bool heterogeneusReactions_;
        bool energyEquation_;
        bool userCheck_;

        Cantera::ThermoPhase*  gas_;
        Cantera::Interface*    surface_;
        Cantera::Kinetics*     kinetic_;
        Cantera::Transport*    transport_;

        std::vector<double> omega_;
        std::vector<double> x_;
        std::vector<double> MW_;
        std::vector<double> RfromGas_;
        std::vector<double> RfromSurface_;
        std::vector<double> Z_;
        std::vector<double> Rsurface_;
        std::vector<double> dy_;
        std::vector<double> y_;
        std::vector<double> h_;
        std::vector<double> diff_;
        std::vector<double> omega0_;
        std::vector<double> Tvector_;
        std::vector<double> rhoVector_;
        std::vector<double> cpVector_;
        std::vector<double> condVector_;
        std::vector<double> QfromGasVector_;
        std::vector<double> QfromSurfaceVector_;

        std::vector<std::vector<double> > omegaMatrix_;
        std::vector<std::vector<double> > Zmatrix_;
        std::vector<std::vector<double> > diffMatrix_;
        std::vector<std::vector<double> > RfromGasMatrix_;
        std::vector<std::vector<double> > RfromSurfaceMatrix_;
        std::vector<std::vector<double> > RsurfaceMatrix_;

        unsigned int                           NR_;
        std::vector<double>                    k_;
        std::vector<double>                    Eatt_;
        std::vector<double>                    n_;
        std::vector<double>                    a_;
        std::vector<double>                    b_;
        std::vector<double>                    Quser_;
        std::vector<int>                       index1_;
        std::vector<int>                       index2_;
        std::vector<int>                       canteraIndex_;
        std::vector<std::vector<std::string> > name_;
        std::vector<std::vector<int> >         stoich_;
        double                                 converter_;
        
        std::vector<double> reactionRate(const std::vector<double> omega,const double rho);
        double              heatOfReaction(const std::vector<double> omega,const double rho, const std::vector<double> h);
        double              meanMolecularWeight(const std::vector<double> omega,const std::vector<double> MW);


        std::vector<double> Length_;
        std::vector<double> Time_;
        std::vector<double> Pressure_;
        std::vector<double> Temperature_;
        std::vector<std::vector<double> > Specie_;
        std::vector<std::vector<double> > Site_;

        std::vector<std::vector<double> > TemperatureTransient_;
        std::vector<std::vector<std::vector<double> > > SpecieTransient_;
        std::vector<std::vector<std::vector<double> > > SiteTransient_;


        
        std::vector<bool>   algb_;
    };
}

#endif