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
## @deftypefn {Function File} {@var{retval} =} lagrange (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andresold <andresold@andresold-Aspire-R7-371T>
## Created: 2018-02-13

function yy=lagrange(x,y,xx)
N=length(x);
yy=zeros(size(xx));

for k=1:N
    t=ones(size(xx));
    for j=[1:k-1, k+1:N]
        t=t.*(xx-x(j))/(x(k)-x(j));
    end
    yy = yy + y(k)*t;
end
