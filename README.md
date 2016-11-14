# Sales-Taxes

[![Build Status](https://travis-ci.org/chicio/Sales-Taxes.svg?branch=master)](https://travis-ci.org/chicio/Sales-Taxes)
[![codecov](https://codecov.io/gh/chicio/Sales-Taxes/branch/master/graph/badge.svg)](https://codecov.io/gh/chicio/Sales-Taxes)
![Supported platform](https://img.shields.io/badge/platform-iOS-orange.svg)

An iOS implementation of the Sales Taxes technical interview problem.

***
### Introduction
This is the text of the problem:
>Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.
> &nbsp;
> When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax. <br/>
>Write an application that prints out the receipt details for these shopping baskets...
>
>INPUT
>
><ul>Input 1:
> <li>1 book at 12.49 </li>
> <li>1 music CD at 14.99</li>
> <li>1 chocolate bar at 0.85</li>
> </ul>
> 
><ul>Input 2:
> <li>1 imported box of chocolates at 10.00</li>
> <li>1 imported bottle of perfume at 47.50</li>
></ul>
>
><ul>Input 3:
> <li>1 imported bottle of perfume at 27.99</li>
> <li>1 bottle of perfume at 18.99</li>
> <li>1 packet of headache pills at 9.75</li>
> <li>1 box of imported chocolates at 11.25</li>
></ul>
> <br/>
OUTPUT
>
><ul>Output 1:
> <li>1 book : 12.49</li>
> <li>1 music CD: 16.49</li>
> <li>1 chocolate bar: 0.85</li>
> <li>Sales Taxes: 1.50</li>
> <li>Total: 29.83</li>
></ul>
>
><ul>Output 2:
> <li>1 imported box of chocolates: 10.50</li>
> <li>1 imported bottle of perfume: 54.65</li>
> <li>Sales Taxes: 7.65</li>
> <li>Total: 65.15</li>
></ul>
>
><ul>Output 3:
> <li>1 imported bottle of perfume: 32.19</li>
> <li>1 bottle of perfume: 20.89</li>
> <li>1 packet of headache pills: 9.75</li>
> <li>1 imported box of chocolates: 11.85</li>
> <li>Sales Taxes: 6.70</li>
> <li>Total: 74.68</li>
><ul>

***
###Overview

I created a small iOS app written using Objective-C. The app is a prototype with a simple UI that could be used to test visually that the apps meet the requirments of the problem (see animation below).The three input data set contained in the problem text are also contained in a test suit (SalesTaxesTests.m) that could be used to verify the correctness of the code.

<p align="center">
<img src="https://github.com/chicio/Sales-Taxes/blob/master/Screenshots/app-ui.gif"/>
</p>

***
###Tools
I used <a href="https://travis-ci.org">Travis-CI</a> as Continuous Integration service (s).
I used OCMock as Mocking framework for the test implementation.
I used <a href="https://codecov.io/gh">codecov</a> as Code Coverage service.
Code coverage has also been activated in XCode scheme. In this way it is possible to see code coverage live inside the IDE (see screenshot below).

<p align="center">
<img src="https://github.com/chicio/Sales-Taxes/blob/master/Screenshots/xcode-code-coverage.png"/>
</p>

<p align="center">
<img src="https://github.com/chicio/Sales-Taxes/blob/master/Screenshots/xcode-code-coverage-2.png"/>
</p>

All code has been commented using XCode documentation syntax. It is possible to access to the documentation of a class or method using the shorcut Alt + Left Mouse Click on any name (see screenshot below).

<p align="center">
<img src="https://github.com/chicio/Sales-Taxes/blob/master/Screenshots/xcode-comments.png"/>
</p>
