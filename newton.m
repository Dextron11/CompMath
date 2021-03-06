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
## @deftypefn {Function File} {@var{retval} =} newton (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andresold <andresold@andresold-Aspire-R7-371T>
## Created: 2018-03-05
 
function yy = newton(x, y, xx)
pkg load symbolic ;
N = length(x);
d = y;
for  k = 1 : N-1
     for i = 1: N - k
          d(i) = (d(i+1) - d(i)) / (x(i+k) - x(i));
      end
end
yy = d(1) * ones(size(xx));
for k = 2 : N
     yy = d(k) + (xx - x(k)) .* yy;
end
endfunction