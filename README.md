# Flutter - Export Products with Excel and Firestore

A flutter project created to export products from an excel file and store them in a Firestore database.

It has a tutorial, a list of products, the option to upload an excel file and select the columns to export (Name, Price and Stock), as well as a product search by name.

<div>
    <img src="https://img.shields.io/badge/Made%20with-flutter-blue">
    <img src="https://img.shields.io/badge/Made%20with-Firestore-yellow">
    <img src="https://img.shields.io/badge/SDK%20version-%3E%3D2.18.1-orange">
</div>

## Packages

<ul>
    <li>
        <a href="https://pub.dev/packages/firebase_core" target="_blank">Firebase Core</a>
    </li>
    <li>
        <a href="https://pub.dev/packages/cloud_firestore" target="_blank">Cloud Firestore</a>
    </li>
    <li>
        <a href="https://pub.dev/packages/excel/versions/2.0.0-null-safety-3" target="_blank">Excel</a>
    </li>
    <li>
        <a href="https://pub.dev/packages/file_picker" target="_blank">File Picker</a>
    </li>
    <li>
        <a href="https://pub.dev/packages/provider" target="_blank">Provider</a>
    </li>
    <li>
        <a href="https://pub.dev/packages/shared_preferences" target="_blank">Shared Preferences</a>
    </li>
</ul>

## Requirements

Create a Firebase project with Firestore.

Use FlutterFire CLI for credentiasl config or add the credentials on file lib/firebase_options.dart.

## Screenshots
<div style="display:grid; grid-template-columns: 1fr 1fr 1fr;">
    <div style="margin: 0 10px; text-align: center">
        <p style="font-size: 16px; font-weight: bold;">Home & Tutorial</p>
        <img  width="300" height="650" src="https://res.cloudinary.com/dinz56p67/image/upload/v1670886473/flutter%20excel%20firebase/home-tutorial_lqyicd.gif">
    </div>
    <div style="margin: 0 10px; text-align: center">
        <p style="font-size: 16px; font-weight: bold;">Upload products from Excel</p>
        <img  width="300" height="650" src="https://res.cloudinary.com/dinz56p67/image/upload/v1670886526/flutter%20excel%20firebase/upload-file_tgrqd6.gif">
    </div>
    <div style="margin: 0 10px; text-align: center">
        <p style="font-size: 16px; font-weight: bold;">Select columns & create products</p>
        <img  width="300" height="650" src="https://res.cloudinary.com/dinz56p67/image/upload/v1670886616/flutter%20excel%20firebase/select-rows_bc47yj.gif">
    </div>
    <div style="margin: 0 10px">
        <p style="font-size: 16px; font-weight: bold;">Search products by name</p>
        <img  width="300" height="650" src="https://res.cloudinary.com/dinz56p67/image/upload/v1670888900/flutter%20excel%20firebase/search_producst_wvuet1.gif">
    </div>
</div>
