{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-codebuild-project-source.html

module Stratosphere.ResourceProperties.CodeBuildProjectSource where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.CodeBuildProjectSourceAuth

-- | Full data type definition for CodeBuildProjectSource. See
-- 'codeBuildProjectSource' for a more convenient constructor.
data CodeBuildProjectSource =
  CodeBuildProjectSource
  { _codeBuildProjectSourceAuth :: Maybe CodeBuildProjectSourceAuth
  , _codeBuildProjectSourceBuildSpec :: Maybe (Val Text)
  , _codeBuildProjectSourceLocation :: Maybe (Val Text)
  , _codeBuildProjectSourceType :: Val Text
  } deriving (Show, Eq)

instance ToJSON CodeBuildProjectSource where
  toJSON CodeBuildProjectSource{..} =
    object $
    catMaybes
    [ fmap (("Auth",) . toJSON) _codeBuildProjectSourceAuth
    , fmap (("BuildSpec",) . toJSON) _codeBuildProjectSourceBuildSpec
    , fmap (("Location",) . toJSON) _codeBuildProjectSourceLocation
    , (Just . ("Type",) . toJSON) _codeBuildProjectSourceType
    ]

instance FromJSON CodeBuildProjectSource where
  parseJSON (Object obj) =
    CodeBuildProjectSource <$>
      (obj .:? "Auth") <*>
      (obj .:? "BuildSpec") <*>
      (obj .:? "Location") <*>
      (obj .: "Type")
  parseJSON _ = mempty

-- | Constructor for 'CodeBuildProjectSource' containing required fields as
-- arguments.
codeBuildProjectSource
  :: Val Text -- ^ 'cbpsType'
  -> CodeBuildProjectSource
codeBuildProjectSource typearg =
  CodeBuildProjectSource
  { _codeBuildProjectSourceAuth = Nothing
  , _codeBuildProjectSourceBuildSpec = Nothing
  , _codeBuildProjectSourceLocation = Nothing
  , _codeBuildProjectSourceType = typearg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-codebuild-project-source.html#cfn-codebuild-project-source-auth
cbpsAuth :: Lens' CodeBuildProjectSource (Maybe CodeBuildProjectSourceAuth)
cbpsAuth = lens _codeBuildProjectSourceAuth (\s a -> s { _codeBuildProjectSourceAuth = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-codebuild-project-source.html#cfn-codebuild-project-source-buildspec
cbpsBuildSpec :: Lens' CodeBuildProjectSource (Maybe (Val Text))
cbpsBuildSpec = lens _codeBuildProjectSourceBuildSpec (\s a -> s { _codeBuildProjectSourceBuildSpec = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-codebuild-project-source.html#cfn-codebuild-project-source-location
cbpsLocation :: Lens' CodeBuildProjectSource (Maybe (Val Text))
cbpsLocation = lens _codeBuildProjectSourceLocation (\s a -> s { _codeBuildProjectSourceLocation = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-codebuild-project-source.html#cfn-codebuild-project-source-type
cbpsType :: Lens' CodeBuildProjectSource (Val Text)
cbpsType = lens _codeBuildProjectSourceType (\s a -> s { _codeBuildProjectSourceType = a })
