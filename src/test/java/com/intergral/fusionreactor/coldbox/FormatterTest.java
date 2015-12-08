package com.intergral.fusionreactor.coldbox;

import static org.junit.Assert.*;


public class FormatterTest
{

    @org.junit.Test
    public void testFormatLongAsUpTimeString() throws Exception
    {
        assertEquals( "1 S", Formatter.formatLongAsUpTimeString( 1000, true, 1 ) );
        assertEquals( "10 S", Formatter.formatLongAsUpTimeString( 10000, true, 1 ) );
        assertEquals( "59 S", Formatter.formatLongAsUpTimeString( 59000, true, 1 ) );
        assertEquals( "1 M", Formatter.formatLongAsUpTimeString( 60000, true, 1 ) );
        assertEquals( "10 M", Formatter.formatLongAsUpTimeString( 60000 * 10, true, 1 ) );
        assertEquals( "59 M", Formatter.formatLongAsUpTimeString( 60000 * 59, true, 1 ) );
        assertEquals( "1 H", Formatter.formatLongAsUpTimeString( 60000 * 60, true, 1 ) );
        assertEquals( "10 H", Formatter.formatLongAsUpTimeString( 60000 * 60 * 10, true, 1 ) );
        assertEquals( "23 H", Formatter.formatLongAsUpTimeString( 60000 * 60 * 23, true, 1 ) );
        assertEquals( "1 D", Formatter.formatLongAsUpTimeString( 60000 * 60 * 24, true, 1 ) );

        assertEquals( "1 Second", Formatter.formatLongAsUpTimeString( 1000, false, 1 ) );
        assertEquals( "10 Seconds", Formatter.formatLongAsUpTimeString( 10000, false, 1 ) );
        assertEquals( "59 Seconds", Formatter.formatLongAsUpTimeString( 59000, false, 1 ) );
        assertEquals( "1 Minute", Formatter.formatLongAsUpTimeString( 60000, false, 1 ) );
        assertEquals( "10 Minutes", Formatter.formatLongAsUpTimeString( 60000 * 10, false, 1 ) );
        assertEquals( "59 Minutes", Formatter.formatLongAsUpTimeString( 60000 * 59, false, 1 ) );
        assertEquals( "1 Hour", Formatter.formatLongAsUpTimeString( 60000 * 60, false, 1 ) );
        assertEquals( "10 Hours", Formatter.formatLongAsUpTimeString( 60000 * 60 * 10, false, 1 ) );
        assertEquals( "23 Hours", Formatter.formatLongAsUpTimeString( 60000 * 60 * 23, false, 1 ) );
        assertEquals( "1 Day", Formatter.formatLongAsUpTimeString( 60000 * 60 * 24, false, 1 ) );
        assertEquals( "10 Days", Formatter.formatLongAsUpTimeString( 60000 * 60 * 24 * 10, false, 1 ) );
    }
}