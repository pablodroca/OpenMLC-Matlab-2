function individual = show_individual(mlc, idv, fig)
% SHOW_INDIVIDUAL display given individual (MLC2 Toolbox)
%
%   Copyright (C) 2015-2017 Thomas Duriez.
%   This file is part of the OpenMLC-Matlab-2 Toolbox. Distributed under GPL v3.

%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    if nargin<3
        fig=1;
    end
    if isinteger(idv)
        individual=mlc.table.individuals(mlc.population(length(mlc.population)).individuals(idv));
    else
        individual = idv;
    end
        
    eval(['heval=@' mlc.parameters.evaluation_function ';']);
            f=heval;
     
    feval(f,individual,mlc.parameters,1,fig);










