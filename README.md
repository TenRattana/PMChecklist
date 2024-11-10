# Expo Router and Tailwind CSS

Use [Expo Router](https://docs.expo.dev/router/introduction/) with [Nativewind](https://www.nativewind.dev/v4/overview/) styling.

## 🚀 How to use

```sh
npx create-expo-app -e with-router-tailwind
```
CREATE TABLE Permissions (
    PermissionID INT PRIMARY KEY IDENTITY,
    PermissionName NVARCHAR(50) NOT NULL, 
    description NVARCHAR(255)
);

CREATE TABLE GroupPermissions (
    GuserID NVARCHAR(9),
    PermissionID INT,
    Create_Date DATETIME DEFAULT GETDATE(), 
    PRIMARY KEY (GuserID, PermissionID),
    FOREIGN KEY (GuserID) REFERENCES GroupUsers(GuserID) ON DELETE CASCADE,
    FOREIGN KEY (PermissionID) REFERENCES Permissions(PermissionID) ON DELETE CASCADE
);
