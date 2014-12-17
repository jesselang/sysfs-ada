--    SysFS - an interface to Linux sysfs.
--    Copyright (C) 2014 Jesse Lang <jesselang.com>
--    See the bottom of this file for licensing details.
pragma License (Modified_GPL);

with Ada.IO_Exceptions;

package body SysFS.Attributes is
   use Ada;

   procedure Set_Path (Attribute : out Attribute_Info; Path : in String) is
   begin -- Set_Path
      Attribute.Path := Strings.Unbounded.To_Unbounded_String (Path);
   end Set_Path;

   procedure Read (Attribute : in out Attribute_Info; Item : out String; Last : out Natural) is
   begin -- Read
      Text_IO.Open (File => Attribute.File, Name => Strings.Unbounded.To_String (Attribute.Path), Mode => Text_IO.In_File);
      Text_IO.Get_Line (File => Attribute.File, Item => Item, Last => Last);
      Text_IO.Close (File => Attribute.File);
   exception -- Read
      when IO_Exceptions.Name_Error =>
         raise Not_Found;
      when IO_Exceptions.Status_Error =>
         raise Already_Open;
      when IO_Exceptions.Use_Error =>
         raise Not_Supported;
   end Read;

   procedure Write (Attribute : in out Attribute_Info; Item : in String) is
   begin -- Write
      Text_IO.Open (File => Attribute.File, Name => Strings.Unbounded.To_String (Attribute.Path), Mode => Text_IO.Out_File);
      Text_IO.Put_Line (File => Attribute.File, Item => Item);
      Text_IO.Close (File => Attribute.File);
   exception -- Write
      when IO_Exceptions.Name_Error =>
         raise Not_Found;
      when IO_Exceptions.Status_Error =>
         raise Already_Open;
      when IO_Exceptions.Use_Error =>
         raise Not_Supported;
   end Write;
end SysFS.Attributes;

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
