﻿//
//  File: EpsilonPortalConfig.cs
//  Project: R7.Epsilon
//
//  Author: Roman M. Yagodin <roman.yagodin@gmail.com>
//
//  Copyright (c) 2014-2019 Roman M. Yagodin, R7.Labs
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

//
//  File: EpsilonPortalConfig.cs
//  Project: R7.Epsilon
//
//  Author: Roman M. Yagodin <roman.yagodin@gmail.com>
//
//  Copyright (c) 2015-2019 Roman M. Yagodin, R7.Labs
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using System.Web.Compilation;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.DDRMenu;

namespace R7.Epsilon.Components
{
    public class EpsilonPortalConfig
    {
        #region Portal config properties

        public List<ThemeConfig> Themes { get; set; } = new List<ThemeConfig> {
            new ThemeConfig {
                Name = "green",
                Css = "green-theme.min.css",
                Color = "green",
                IsA11yTheme = false

            },
            new ThemeConfig {
                Name = "contrast",
                Css = "contrast-theme.min.css",
                Color = "black",
                IsA11yTheme = true
            }
        };

        public List<CdnConfig> Cdns { get; set; } = new List<CdnConfig> {
            new CdnConfig {
                Location = "PageHead",
                Href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css",
                Integrity = "sha256-UzFD2WYH2U1dQpKDjjZK72VtPeWP50NoJjd26rnAdUI="
            }
        };

        public List<WebsiteConfig> Websites { get; set; } = new List<WebsiteConfig> ();

        public FeedbackConfig Feedback { get; set; } = new FeedbackConfig ();

        public MenuConfig PrimaryMenu { get; set; } = new MenuConfig ();

        public MenuConfig SecondaryMenu { get; set; } = new MenuConfig ();

        public string FooterButtonsGroupName { get; set; }

        public AdsenseConfig Adsense { get; set; } = new AdsenseConfig ();

        public bool ShowTerms { get; set; }

        public bool ShowPrivacy { get; set; }

        public int MenuUrlType { get; set; } = 0;

        public int MenuMinHeaders { get; set; } = 7;

        public bool UseObrnadzorMicrodata { get; set; }

        public List<SocialNetworkConfig> SocialNetworks { get; set; } = new List<SocialNetworkConfig> ();

        public AnalyticsConfig Analytics { get; set; } = new AnalyticsConfig ();

        #endregion

        public ThemeConfig GetTheme (HttpRequest request)
        {
            var theme = default (ThemeConfig);
            var themeName = A11yHelper.GetThemeCookie (request);
            if (themeName != null) {
                theme = Themes.FirstOrDefault (t => t.Name == themeName);
            }

            return theme;
        }
    }

    public class MenuConfig
    {
        public string NodeSelector { get; set; } = "*,0,2";

        public string IncludeNodes { get; set; } = string.Empty;

        public ICollection<string> NodeManipulatorTypes { get; set; } = new Collection<string> ();

        public ICollection<INodeManipulator> NodeManipulators = new Collection<INodeManipulator> ();

        public void LoadNodeManipulators ()
        {
            foreach (var nodeManipulatorType in NodeManipulatorTypes) {
                try {
                    NodeManipulators.Add (((INodeManipulator) Activator.CreateInstance (BuildManager.GetType (nodeManipulatorType, true, true))));
                }
                catch (Exception ex) {
                    Exceptions.LogException (ex);
                }
            }
        }
    }

    public class AdsenseConfig
    {
        // TODO: Should be empty string?
        public string Client { get; set; } = "ca-pub-0000000000000000";

        // TODO: Should be empty string?
        public string Slot { get; set; } = "0000000000";
    }

    // TODO: Rename to SocialNetwork
    public class SocialNetworkConfig
    {
        public string Name { get; set; }

        public string Group { get; set; }

        public bool ShareEnabled { get; set; } = false;

        public bool IsPrimary { get; set; } = false;

        public string ApiId { get; set; } = string.Empty;

        public List<string> Params { get; set; } = new List<string> ();
    }

    public class AnalyticsConfig
    {
        public bool UseSputnik { get; set; } = false;
    }

    public class FeedbackConfig
    {
        public int TabId { get; set; } = -1;

        public string ModuleDefinitionName { get; set; } = "Feedback";

        // TODO: Rename to AllowOpenInPopup
        public bool OpenInPopup { get; set; } = true;
    }

    public class CdnConfig
    {
        public string Href { get; set; }

        public string Integrity { get; set; }

        public string Location { get; set; }
    }

    public class ThemeConfig
    {
        public string Name { get; set; }

        public string Css { get; set; }

        public string Color { get; set; }

        public bool IsA11yTheme { get; set; }
    }

    public class WebsiteConfig
    {
        public string Name { get; set; }

        public string Url { get; set; }

        public string Hreflang { get; set; }

        public bool IsAltWebsite { get; set; }
    }
}

