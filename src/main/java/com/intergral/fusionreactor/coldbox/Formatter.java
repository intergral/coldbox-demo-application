package com.intergral.fusionreactor.coldbox;

/**
 * Copyright 2015 Intergral GmbH

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */
public class Formatter
{
    public static final long MILES_IN_DAY = 86400000L;
    public static final long MILES_IN_HOUR = 3600000L;
    public static final long MILES_IN_MINUTE = 60000L;
    public static final long MILES_IN_SECOND = 1000L;

    public static String formatLongAsUpTimeString( final long time, final boolean shortWord, final int clip )
    {
        String upTime = "";
        final long days = time / MILES_IN_DAY;
        long remainder = time % MILES_IN_DAY;
        final long hours = remainder / MILES_IN_HOUR;
        remainder = remainder % MILES_IN_HOUR;
        final long minutes = remainder / MILES_IN_MINUTE;
        remainder = remainder % MILES_IN_MINUTE;
        final long seconds = remainder / MILES_IN_SECOND;
        int clipCount = 0;
        if( days > 0 )
        {
            upTime += days + (shortWord ? " D" : " Day") + ((days == 1 || shortWord) ? "" : "s");
            clipCount++;
        }
        if( hours > 0 && clipCount < clip )
        {
            upTime = formatEnd( upTime );
            upTime += hours + (shortWord ? " H" : " Hour") + ((hours == 1 || shortWord) ? "" : "s");
            clipCount++;
        }
        if( minutes > 0 && clipCount < clip )
        {
            upTime = formatEnd( upTime );
            upTime += minutes + (shortWord ? " M" : " Minute") + ((minutes == 1 || shortWord) ? "" : "s");
            clipCount++;
        }
        if( seconds > 0 && clipCount < clip )
        {
            upTime = formatEnd( upTime );
            upTime += seconds + (shortWord ? " S" : " Second") + ((seconds == 1 || shortWord) ? "" : "s");
            clipCount++;
        }
        return upTime.trim();
    }

    private static String formatEnd( final String source )
    {
        if( source.isEmpty() )
        {
            return source;
        }
        return source + ", ";
    }
}
