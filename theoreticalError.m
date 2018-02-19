## Copyright (C) 2018 Andresold
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} theoreticalError (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andresold <andresold@andresold-Aspire-R7-371T>
## Created: 2018-02-13

function retval = theoreticalError(interpolationPoints, f, diaposon, errorCheckingPoint)
  pkg load symbolic ; 
  syms x;
  n = length(interpolationPoints);
  derivative=diff(f(x),n);
  derivative=max(f(diaposon));
  omeg = 1;
  for j = [1:(n)]
    omeg = omeg *(errorCheckingPoint-interpolationPoints(j));
  endfor
retval = abs((derivative*omeg)/factorial(n));
endfunction


