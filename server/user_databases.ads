with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Hash_Case_Insensitive;
with Ada.Strings.Unbounded.Equal_Case_Insensitive;
with Ada.Containers.Hashed_Maps;  use Ada.Containers;
with Ada.Text_IO; use Ada.Text_IO;
with Protocol;
with GNAT.String_Split; use GNAT.String_Split;
with Ada.Containers.Doubly_Linked_Lists;  use Ada.Containers;
with ada.containers.Indefinite_Hashed_Maps;
with Ada.Strings.hash;
with Ada.Exceptions; use Ada.Exceptions;
with Ada.IO_Exceptions;
with DataTypes; use DataTypes;

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Dieses Paket bündelt Typen um Benutzer des Chats zu verwalten. Es unterhält unter anderem Funktionen um User zu registrieren und die
-- Benutzerdatenbank zu speichern oder zu laden.
--
-- Autoren: Daniel Kreck, Leonard Schmischke
-- Letzte Änderung: 29.04.2016
-----------------------------------------------------------------------------------------------------------------------------------------------------------
package User_Databases is

   --------------------------------------------------------------------------------------------------------------------------------------------------------
   -- > Öffentliche Typen

   type User_Database is tagged private;

   --------------------------------------------------------------------------------------------------------------------------------------------------------
   -- > Öffentliche Funktionen zum Typ User_Database

   function registerUser(this : in out User_Database; username : in Unbounded_String; password : in Unbounded_String) return Boolean;
   function getUser(database : in User_Database; username : in Unbounded_String) return UserPtr;

   procedure saveUserDatabase(this : in User_Database); -- writes User Database to file
   procedure loadUserDatabase(this : in out User_Database); -- loads user database from file

   --------------------------------------------------------------------------------------------------------------------------------------------------------

private

   package User_Maps is new Hashed_Maps
     (Key_Type => Unbounded_String,
      Element_Type => UserPtr,
      Hash => Ada.Strings.Unbounded.Hash_Case_Insensitive,
      Equivalent_Keys => "=");
   use User_Maps;

   package contactNamesList is new Doubly_Linked_Lists(Element_Type => Unbounded_String);

   package userToContactNamesMap is new Indefinite_Hashed_Maps
     (Key_Type => Unbounded_String,
      Element_Type => contactNamesList.List,
      Hash => Ada.Strings.Unbounded.Hash_Case_Insensitive,
      Equivalent_Keys => Ada.strings.Unbounded.Equal_Case_Insensitive,
      "=" => contactNamesList."=");
   use userToContactNamesMap;

   --------------------------------------------------------------------------------------------------------------------------------------------------------
   -- > Öffentliche Funktionen zum Typ User_Database

   function userToUnboundedString(this : in out UserPtr) return Unbounded_String;
   function StringToLonelyUser(inputLine : in String; database : in User_Database; contactNames : out contactNamesList.List  ) return UserPtr;

   --------------------------------------------------------------------------------------------------------------------------------------------------------
   -- > Öffentliche Typen

   type User_Database is tagged record
      users : User_Maps.Map; -- # username -> userDataSet
      databaseFileName: Unbounded_String := To_Unbounded_String("ADAChatDatabase.txt");
      maxSize : Integer := 1000000;

   end record;


end User_Databases;
