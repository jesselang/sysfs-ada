--    SysFS - an interface to Linux sysfs.
--    Copyright (C) 2014 Jesse Lang <jesselang.com>
--    See the bottom of this file for licensing details.
pragma License (Modified_GPL);

-- This package provides a type and operations to work with sysfs attributes (files).

private with Ada.Strings.Unbounded;
private with Ada.Text_IO;

package SysFS.Attributes is
   type Attribute_Info is limited private;

   Already_Open : exception;

   procedure Open (Attribute : out Attribute_Info; Path : in String);
   -- Open Attribute found at Path.
   -- Raises Already_Open when the attribute at Path is already open (either by another Attribute_Info object, or externally.)
   -- Raises Not_Found when no attribute was found at Path.
   -- Raises Not_Supported when the external environment does not support opening of the attribute at Path.

   Not_Open : exception;

   procedure Close (Attribute : in out Attribute_Info);
   -- Close Attribute.
   -- Raises Not_Open when Attribute was not first opened with Open.

   procedure Read (Attribute : in out Attribute_Info; Item : out String; Last : out Natural);
   -- Read the value from Attribute into Item.
   -- Sets Last to the index value of the last character assigned to Item.
   -- Raises Not_Open when Attribute was not first opened with Open.
   -- Raises Not_Supported when the external environment does not support reading from Attribute.

   procedure Write (Attribute : in out Attribute_Info; Item : in String);
   -- Write the value of Item to Attribute.
   -- Raises Not_Open when Attribute was not first opened with Open.
   -- Raises Not_Supported when the external environment does not support writing to Attribute.
private -- SysFS.Attributes
   type Attribute_Info is limited record
      Path : Ada.Strings.Unbounded.Unbounded_String;
      File : Ada.Text_IO.File_Type;
   end record;
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
