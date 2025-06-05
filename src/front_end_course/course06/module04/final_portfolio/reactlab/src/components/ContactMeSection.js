import React, {useEffect} from "react";
import { useFormik } from "formik";
import {
  Box,
  Button,
  FormControl,
  FormErrorMessage,
  FormLabel,
  Heading,
  Input,
  Select,
  Textarea,
  VStack,
} from "@chakra-ui/react";
import * as Yup from 'yup';
import FullScreenSection from "./FullScreenSection";
import useSubmit from "../hooks/useSubmit";
import {useAlertContext} from "../context/alertContext";

const LandingSection = () => {

  const {isLoading, response, submit} = useSubmit();
  const { onOpen } = useAlertContext();


  const validationSchema = Yup.object().shape({
       firstName: Yup.string().required("First Name is required"),
       email: Yup.string().email("Invalid email").required("Email is required"),
       password: Yup.string().required("Password is required").min(8, "Password must be at least 8 characters")
     });

  const formik = useFormik({
    initialValues: { firstName: '', email: '', type:'hireMe', comment:'' },
    onSubmit: (values) => {
      submit("https://jsonplaceholder.typicode.com/posts", values)
        .then(() => {
          onOpen({
            title: "Success",
            description: response.message,
            status: response.type,
          });
        })
        .catch(() => {
          onOpen({
            title: "Error",
            description: "Something went wrong, please try again later!",
            status: "Failed to obtain response.",
          });
        });
      formik.resetForm();  

    },
    validationSchema: validationSchema,
  });

  return (
    <FullScreenSection
      isDarkBackground
      backgroundColor="#512DA8"
      py={16}
      spacing={8}
    >
      <VStack w="1024px" p={32} alignItems="flex-start">
        <Heading as="h1" id="contactme-section">
          Contact me
        </Heading>
        <Box p={6} rounded="md" w="100%">

            <form submit={submit}>
              <VStack spacing={4}>
                <FormControl isInvalid={false}>
                  <FormLabel htmlFor="firstName">Name</FormLabel>
                  <Input
                    id="firstName"
                    name="firstName"
                    placeholder="Enter your first name"
                  />
                  <FormErrorMessage></FormErrorMessage>
                </FormControl>
                <FormControl isInvalid={false}>
                  <FormLabel htmlFor="email">Email Address</FormLabel>
                  <Input
                    id="email"
                    name="email"
                    type="email"
                    placeholder="Enter your email address"
                  />
                  <FormErrorMessage></FormErrorMessage>
                </FormControl>
                <FormControl>
                  <FormLabel htmlFor="type">Type of enquiry</FormLabel>
                  <Select id="type" name="type" color="white" bg="#512DA8" fontWeight="normal">
                    <option value="hireMe"  style={{backgroundColor:"#512DA8"}}>Freelance project proposal</option>
                    <option value="openSource" style={{backgroundColor:"#512DA8"}}>
                      Open source consultancy session
                    </option>
                    <option value="other" style={{backgroundColor:"#512DA8"}}>Other</option>
                  </Select>
                </FormControl>
                <FormControl isInvalid={false}>
                  <FormLabel htmlFor="comment">Your message</FormLabel>
                  <Textarea
                    id="comment"
                    name="comment"
                    height={250}
                    placeholder="Enter your message here"
                  />
                  <FormErrorMessage></FormErrorMessage>
                </FormControl>
                <Button type="submit" colorScheme="purple" width="full">
                  Submit
                </Button>
              </VStack>
            </form>

        </Box>
      </VStack>
    </FullScreenSection>
  );
};

export default LandingSection;
