﻿//
//  MarkupParser.cs
//
//  Author:
//       Roman M. Yagodin <roman.yagodin@gmail.com>
//
//  Copyright (c) 2016 Roman M. Yagodin
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
using System;
using System.Collections.Generic;

namespace R7.Epsilon.Components
{
    public static class MarkupParser
    {
        public static string ParseAttribute (string markup, string attr)
        {
            var startIndex = markup.IndexOf (attr + "=\"", StringComparison.OrdinalIgnoreCase) + attr.Length + 2;
            if (startIndex >= 0) {
                var endIndex = markup.IndexOf ("\"", startIndex, StringComparison.OrdinalIgnoreCase);
                return markup.Substring (startIndex, endIndex - startIndex);
            }

            return null;
        }

        public static List<DynamicPane> ParseLayout (string markup)
        {
            const string runatServer = "runat=\"server\"";
            var listPanes = new List<DynamicPane> ();
            var prevEndPaneIndex = 0;

            // find first pane
            var paneIndex = markup.IndexOf (runatServer, StringComparison.Ordinal);
            while (paneIndex >= 0) {

                var startPaneIndex = markup.LastIndexOf ("<", paneIndex, StringComparison.Ordinal);
                var endPaneIndex = markup.IndexOf ("/>", paneIndex + runatServer.Length, StringComparison.Ordinal) + 2;
                var paneMarkup = markup.Substring (startPaneIndex, endPaneIndex - startPaneIndex);

                var pane = new DynamicPane (paneMarkup);
                pane.MarkupBefore = markup.Substring (prevEndPaneIndex, startPaneIndex - prevEndPaneIndex);

                prevEndPaneIndex = endPaneIndex;

                listPanes.Add (pane);

                if (endPaneIndex >= (markup.Length - 1)) {
                    break;
                }

                // find next pane
                paneIndex = markup.IndexOf (runatServer, prevEndPaneIndex, StringComparison.Ordinal);
            }

            if (listPanes.Count > 0) {
                listPanes [listPanes.Count - 1].MarkupAfter = markup.Substring (prevEndPaneIndex);
            }

            return listPanes;
        }
    }
}