import {
  Heading,
  HStack,
  Image,
  Text,
  Box,
  VStack,
  Spacer,
} from "@chakra-ui/react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowRight } from "@fortawesome/free-solid-svg-icons";
import React from "react";
import "./Card.css"
const Card = ({ title, description, imageSrc }) => {
  // Implement the UI for the Card component according to the instructions.
  // You should be able to implement the component with the elements imported above.
  // Feel free to import other UI components from Chakra UI if you wish to.

  return (
    <Box className="Box-Props">
      <VStack className="Vertical-Props"
      >
        <Image className="Image"    src={imageSrc} />
        <Box className="Image-Box-Props" >
          <Heading py={6}>{title}</Heading>
          <Text>{description}</Text>
          <text>
            see more <FontAwesomeIcon icon={faArrowRight} />
          </text>
        </Box>
      </VStack>
    </Box>
  );
};

export default Card;
