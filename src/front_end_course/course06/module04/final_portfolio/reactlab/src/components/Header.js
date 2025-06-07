import React, { useEffect, useRef } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEnvelope } from "@fortawesome/free-solid-svg-icons";
import {
  faGithub,
  faLinkedin,
  faSteam,
  faDiscord,
} from "@fortawesome/free-brands-svg-icons";
import { Box, HStack } from "@chakra-ui/react";

const socials = [
  {
    icon: faEnvelope,
    url: "mailto: figueroa@brainycode.com",
  },
  {
    icon: faGithub,
    url: "https://github.com/nyguerrillagirl",
  },
  {
    icon: faLinkedin,
    url: "https://www.linkedin.com/in/lorraine-figueroa-4220254",
  },
  {
    icon: faSteam,
    url: "https://steamcommunity.com/profiles/76561197993490051/",
  },
  {
    icon: faDiscord,
    url: "https://discord.com/users/lafigueroa",
  },
];

const Header = () => {
  const handleClick = (anchor) => () => {
    const id = `${anchor}-section`;
    const element = document.getElementById(id);
    if (element) {
      element.scrollIntoView({
        behavior: "smooth",
        block: "start",
      });
    }
  };

  const SocialMediaLinks = () => {
    return (
      <HStack spacing={4}>
        {socials.map((social, index) => (
          <a
            key={index}
            href={social.url}
            target="_blank"
            rel="noopener noreferrer"
          >
            <FontAwesomeIcon icon={social.icon} size="lg" />
          </a>
        ))}
      </HStack>
    );
  }

  const InternalLinks = () => {
    return (
      <HStack spacing={8}>
        <a href="#projects-section" onClick={handleClick("projects")}>
          Projects
        </a>
        <a href="#contactme-section" onClick={handleClick("contactme")}>
          Contact me
        </a>
      </HStack>
    );
  }
  return (
    <Box
      position="fixed"
      top={0}
      left={0}
      right={0}
      translateY={0}
      transitionProperty="transform"
      transitionDuration=".3s"
      transitionTimingFunction="ease-in-out"
      backgroundColor="#18181b"
    >
      <Box color="white" maxWidth="1280px" margin="0 auto">
        <HStack
          px={16}
          py={4}
          justifyContent="space-between"
          alignItems="center"
        >
          <nav>
            {/* Add social media links based on the `socials` data */}
            <SocialMediaLinks />
          </nav>
          <nav>
            <HStack spacing={8}>
              {/* Add links to Projects and Contact me section */}
              <InternalLinks />
            </HStack>
          </nav>
        </HStack>
      </Box>
    </Box>
  );
};
export default Header;
