--    SysFS - an interface to Linux sysfs.
--    Copyright (C) 2014 Jesse Lang <jesselang.com>
--    See the bottom of this file for licensing details.
pragma License (Modified_GPL);

package SysFS.Utilities is
   Default_Path   : constant String := "/sys";
   Custom_Path_ID : constant String := "SYSFS_PATH";

   function Mount_Point return String;
   -- Returns the mount point for sysfs.
   -- If Custom_Path_Key is set in the environment, that value will be returned.
   -- Otherwise, Default_Path will be returned.
end SysFS.Utilities;

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
