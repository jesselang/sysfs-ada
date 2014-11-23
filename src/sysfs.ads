--    SysFS - an interface to Linux sysfs.
--    Copyright (C) 2014 Jesse Lang <jesselang.com>
--    See the bottom of this file for licensing details.
pragma License (Modified_GPL);

package SysFS is
   pragma Pure;

   -- Subsystem constants.
   Bus_ID     : constant String;
   Class_ID   : constant String;
   Block_ID   : constant String;
   Devices_ID : constant String;
   Drivers_ID : constant String;

   -- Common exceptions.
   Not_Found     : exception;
   Not_Supported : exception;
private -- SysFS
   Bus_ID     : constant String := "bus";
   Class_ID   : constant String := "class";
   Block_ID   : constant String := "block";
   Devices_ID : constant String := "devices";
   Drivers_ID : constant String := "drivers";
end SysFS;

--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
--    As a special exception, if other files instantiate generics from
--    this unit, or you link this unit with other files to produce an
--    executable, this unit does not by itself cause the resulting
--    executable to be covered by the GNU General Public License. This
--    exception does not however invalidate any other reasons why the
--    executable file might be covered by the GNU Public License.
