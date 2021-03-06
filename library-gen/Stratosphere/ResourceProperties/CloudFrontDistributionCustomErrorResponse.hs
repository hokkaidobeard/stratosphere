{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cloudfront-distributionconfig-customerrorresponse.html

module Stratosphere.ResourceProperties.CloudFrontDistributionCustomErrorResponse where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for CloudFrontDistributionCustomErrorResponse.
-- See 'cloudFrontDistributionCustomErrorResponse' for a more convenient
-- constructor.
data CloudFrontDistributionCustomErrorResponse =
  CloudFrontDistributionCustomErrorResponse
  { _cloudFrontDistributionCustomErrorResponseErrorCachingMinTTL :: Maybe (Val Integer)
  , _cloudFrontDistributionCustomErrorResponseErrorCode :: Val Integer
  , _cloudFrontDistributionCustomErrorResponseResponseCode :: Maybe (Val Integer)
  , _cloudFrontDistributionCustomErrorResponseResponsePagePath :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON CloudFrontDistributionCustomErrorResponse where
  toJSON CloudFrontDistributionCustomErrorResponse{..} =
    object $
    catMaybes
    [ fmap (("ErrorCachingMinTTL",) . toJSON . fmap Integer') _cloudFrontDistributionCustomErrorResponseErrorCachingMinTTL
    , (Just . ("ErrorCode",) . toJSON . fmap Integer') _cloudFrontDistributionCustomErrorResponseErrorCode
    , fmap (("ResponseCode",) . toJSON . fmap Integer') _cloudFrontDistributionCustomErrorResponseResponseCode
    , fmap (("ResponsePagePath",) . toJSON) _cloudFrontDistributionCustomErrorResponseResponsePagePath
    ]

instance FromJSON CloudFrontDistributionCustomErrorResponse where
  parseJSON (Object obj) =
    CloudFrontDistributionCustomErrorResponse <$>
      fmap (fmap (fmap unInteger')) (obj .:? "ErrorCachingMinTTL") <*>
      fmap (fmap unInteger') (obj .: "ErrorCode") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "ResponseCode") <*>
      (obj .:? "ResponsePagePath")
  parseJSON _ = mempty

-- | Constructor for 'CloudFrontDistributionCustomErrorResponse' containing
-- required fields as arguments.
cloudFrontDistributionCustomErrorResponse
  :: Val Integer -- ^ 'cfdcerErrorCode'
  -> CloudFrontDistributionCustomErrorResponse
cloudFrontDistributionCustomErrorResponse errorCodearg =
  CloudFrontDistributionCustomErrorResponse
  { _cloudFrontDistributionCustomErrorResponseErrorCachingMinTTL = Nothing
  , _cloudFrontDistributionCustomErrorResponseErrorCode = errorCodearg
  , _cloudFrontDistributionCustomErrorResponseResponseCode = Nothing
  , _cloudFrontDistributionCustomErrorResponseResponsePagePath = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cloudfront-distributionconfig-customerrorresponse.html#cfn-cloudfront-distributionconfig-customerrorresponse-errorcachingminttl
cfdcerErrorCachingMinTTL :: Lens' CloudFrontDistributionCustomErrorResponse (Maybe (Val Integer))
cfdcerErrorCachingMinTTL = lens _cloudFrontDistributionCustomErrorResponseErrorCachingMinTTL (\s a -> s { _cloudFrontDistributionCustomErrorResponseErrorCachingMinTTL = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cloudfront-distributionconfig-customerrorresponse.html#cfn-cloudfront-distributionconfig-customerrorresponse-errorcode
cfdcerErrorCode :: Lens' CloudFrontDistributionCustomErrorResponse (Val Integer)
cfdcerErrorCode = lens _cloudFrontDistributionCustomErrorResponseErrorCode (\s a -> s { _cloudFrontDistributionCustomErrorResponseErrorCode = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cloudfront-distributionconfig-customerrorresponse.html#cfn-cloudfront-distributionconfig-customerrorresponse-responsecode
cfdcerResponseCode :: Lens' CloudFrontDistributionCustomErrorResponse (Maybe (Val Integer))
cfdcerResponseCode = lens _cloudFrontDistributionCustomErrorResponseResponseCode (\s a -> s { _cloudFrontDistributionCustomErrorResponseResponseCode = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cloudfront-distributionconfig-customerrorresponse.html#cfn-cloudfront-distributionconfig-customerrorresponse-responsepagepath
cfdcerResponsePagePath :: Lens' CloudFrontDistributionCustomErrorResponse (Maybe (Val Text))
cfdcerResponsePagePath = lens _cloudFrontDistributionCustomErrorResponseResponsePagePath (\s a -> s { _cloudFrontDistributionCustomErrorResponseResponsePagePath = a })
